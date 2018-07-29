---
title: Octopress 3.0 is coming
date: 2015-06-08T19:21:25-05:00
layout: theme:post
---

The way Octopress is being distributed and maintained is nearing its end. There are many things I've always disliked about how Octopress works. So before I talk about the exciting part, I'd like to tell you what's wrong with Octopress.

### What's wrong?

If I'm being harsh, I'll tell you that as it is now, Octopress is basically some guy's Jekyll blog you can fork and modify. The first, and most obvious flaw, is that Octopress is distributed through Git. I want to punch through a wall when I think about users wrestling with merge conflicts from updating their sites. It’s absurd.

Octopress is released as a single product, but it's a collection of plugins and configurations which are hard to disentangle. if you want to change or remove anything you're leaving the "golden path" and updates will be painful, if not impossible — short of copy and paste. Even *I* can't remove things from Octopress. If I want to stop maintaining a plugin it will also disappear for anyone who updates. While some have suggested using Git tags as a kind of steam-punk versioning, that simply will not solve the real problem. This isn't how software products should be distributed. Git is for collaborators; not users.

Then there are the themes. I planned to create a system for distributing themes independently from Octopress, but I hadn’t solved it when I released 2.0. Even then, I've come across quite a few websites with Octopress theme galleries. While there are some nice ones, they are all distributed through git and installed with an ill-conceived rake task that was never meant to be used for this. All of this is a constant reminder that many people are spending time building on my mistakes.

<p><span class="pullquote-right" data-pullquote="The part I dislike the most is the notion that Octopress and Jekyll are different communities."></span>However, the part I dislike the most is the notion that Octopress and Jekyll are different communities. Because Octopress is single product with a theme, plugins, and command line automation, the best I could offer the Jekyll community was a pile of source code. It was effectively a salvage yard of ideas on Jekyll blogging.</p>

I've spent the two and a half years working on the next version of Octopress. Two years ago, Parker Moore joined the team and with his help. I’ve finally built something I’m proud of.

### What's coming?

This release is a full rewrite. Octopress as it is now will be replaced by a selection of gems, each semantically versioned with is own documentation and tests. Of the gems I’ve written for this release, some are replacements for plugins that were originally integrated into Octopress and others are completely new. I will be working on a migration guide for current Octopress users, but each plugin can be used on any Jekyll site. **There will no longer be a division between Octopress and Jekyll.**

Here’s a brief overview of the core components of the new Octopress.

**The Octopress CLI** replaces the old Rakefile and has some new tricks too. With [octopress](https://github.com/octopress/octopress) and the [octopress-deploy](https://github.com/octopress/deploy) gem you can:

- Quickly create new pages, posts, drafts, and collections.
- Upgrade your drafts workflow with the `publish` and `unpublish` commands.
- Use templates, like: `octopress new post --template sponsor`.
- Deploy via Git, Rsync, and S3.
- View local documentation with the `docs` command.

That last one is actually pretty neat. Each Octopress gem integrates its documentation with the Octopress CLI so when you run `octopress docs` from your site, you’ll see the documentation for the exact version of every plugin your site is using. Switch to a different site with different plugins and you’ll see a different docs site. Third-party gem-based plugin can easily integrate their documentation too. I’m even using this documentation system to build the new Octopress website.

[Octopress Ink](https://github.com/octopress/ink) is a framework I’ve built for helping plugin authors rapidly build powerful plugins and themes for Jekyll sites. It has some crazy cool features.

- Plugins are easily installed and removed; they only affect the build. A user's source is left alone.
- Use a plugin's layouts, includes, pages and files right from the gem, for example: <code>&#123;% include twitter:feed.html %&#125;</code>.
- Plugin Javascripts, Stylesheets, images, fonts, etc. are easily integrated.
- Each plugin’s javascripts and stylesheets are compiled, compressed, and fingerprinted automatically.
- Users can override or disable any component of a plugin.
- Each plugin is configured independently at `_plugins/plugin_name/config.yml`, so no more pollution of Jekyll's _config.yml.
- Generate a plugin scaffold with `octopress ink new <PLUGIN_NAME>` and build powerful, gem-based plugins quickly.

In order to remain sane working on all this, I created some new developer tools as well. If you are building Jekyll plugins or even just working with advanced templates, these should be helpful.

[Clash](https://github.com/imathis/clash) is a simple static-site test suite. It can build Jekyll sites with different configurations and it compares output with a simple but powerful diff system.

[Octopress Debugger](https://github.com/octopress/debugger) lets you add a Liquid tag <code>&#123;% debug %&#125;</code>, to your sites and interact with the `site`, `page` and, `scopes` instances in an interactive ruby console. This makes it easy to see how variables are set, or even step through a for loop. It’s a cool way to see what Jekyll is doing under the hood as it builds your site.

Finally, I’m working on a new theme. It’s called “Octopress Genesis”, and it will demonstrate many of the features of Octopress Ink and set a pattern for how Jekyll themes should be created. Once that’s finished, I’ll use it for the new docs site and launch this beast.

There’s a lot more — around 30 gems at this point — and if you’re curious, you can browse the [Octopress organization on GitHub](https://github.com/octopress). Quite a few people have been using these plugins already and their issues and pull-requests have been a great help.

### The release plan

For the release, I plan to do the following:

1. Finish Octopress Genesis
2. Write a migration guide
3. Move the `master` branch to the `legacy` branch for maintenance releases and modify rake tasks accordingly.
4. Move `imathis/octopress` to the Octopress org on GitHub.
5. Release the new docs site.
6. Release Octopress as 3.0 and Octopress Ink as 1.0

After the release, I will begin closing out issues and pull requests that can be resolved by replacing old plugins with gems. Anyone who wants to help with that effort will earn a special place in my heart. Working on the “legacy codebase” is very challenging and I intend to avoid anything but critical updates in the future.

Thanks to everyone for your help, encouragement, and patience as I figure out what I’m doing in public. I can’t wait to ship this and I look forward to a bright future with a better Octopress.

— Brandon Mathis
