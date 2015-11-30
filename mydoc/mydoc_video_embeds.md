---
title: Video embeds
tags: [formatting]
keywords: videos, youtube, vimeo, video js, video wrapper, mp4, stream
last_updated: November 30, 2015
summary: "You can embed files with a Video JS wrapper by adding 'video: true' in the frontmatter. Alternatively, you can just fall back on the default video wrapper in the browser."
video: true
---


## About Video JS
The theme has the [video.js](http://www.videojs.com/) player integrated. But the scripts only appear on a page or post if you have certain frontmatter in that page or post. If you want to embed a video in a page and use the Video JS player, add `video: true` in your frontmatter of a page or post, and then add code like this where you want the video to appear:

```html
<p><video id="scenario-1" class="video-js vjs-default-skin vjs-big-play-centered" controls
 preload="auto" width="640" height="480" data-setup='{}'>
  <source src="http://idratherbetellingstories.com/podcasts/ontariochapterpresentation/ontariochapterv4.mp4" type='video/mp4'>
</video></p>
```

Here's an example: 

<p><video id="scenario-1" class="video-js vjs-default-skin vjs-big-play-centered" controls
 preload="auto" width="640"  height="480" data-setup='{}'>
  <source src="http://idratherbetellingstories.com/podcasts/ontariochapterpresentation/ontariochapterv4.mp4" type='video/mp4'>
</video></p>

If you want the player button in the upper-left corner (which is the default), remove the `vjs-big-play-centered` from the video class.

<p><video id="scenario-1" class="video-js vjs-default-skin" controls
 preload="auto" width="640" height="480" data-setup='{}'>
  <source src="http://idratherbetellingstories.com/podcasts/ontariochapterpresentation/ontariochapterv4.mp4" type='video/mp4'>
</video></p>

Here are [more details on this video player from Video JS](https://github.com/videojs/video.js/blob/stable/docs/guides/setup.md).

Note that if some of the js doesn't load correctly, the default fallback player is the regular HTML5 video player available via the browser. Here's an example of the built-in browser video wrapper:

<p><video width="640" controls>
  <source src="http://idratherbetellingstories.com/podcasts/ontariochapterpresentation/ontariochapterv4.mp4" type="video/mp4">
Your browser does not support the video tag.
</video></p>

However, I don't think the built-in browser video players work very well (you can't easily scrub around the video without seeing lots of buffering and other issues). But definitely compare the two. You may find that adding the Video JS wrapper is overkill.

{{site.data.alerts.warning}}Github wasn't designed to store video content. If you have an mp3 file, don't store it in your Github directory. Instead, put it on a web host using regular FTP methods, or stream the video from a video streaming service such as Youtube or Vimeo. Also, note that Github's Large File Storage (which does handle large files) isn't compatible with Github Pages.{{site.data.alerts.end}}