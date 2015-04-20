---
title: Videos
permalink: /videos/
audience: writer, designer
tags: formatting
---

The theme has the [video.js](http://www.videojs.com/) player integrated. But the scripts only appear on a page or post if you have certain frontmatter in that page or post. If you want to embed a video in a page and use the Video JS player, add `video: true` in your frontmatter of a page or post, and then add code like this where you want the video to appear:

{% raw %}
```html
<video id="scenario-1" class="video-js vjs-default-skin" controls
 preload="auto" width="640" height="360" data-setup='{}'>
  <source src="{{site.baseurl}}/videos/scenario1.mp4" type='video/mp4'>
</video>
```
{% endraw %}

You'll know it's working if the video wrapper looks like the one here: [video.js: the open source HTML5 video player](http://www.videojs.com/). The play button will be in the upper-left corner. If you want the player button in the middle, change the class to `video-js vjs-default-skin vjs-big-play-centered`.

Here are [more details on this video player](https://github.com/videojs/video.js/blob/stable/docs/guides/setup.md).

There are a number of javascript files included in inside the video-js folder inside the js folder. This allows the player to work offline. 

Note that if some of the js doesn't load correctly, the default fallback player is the regular HTML5 video player available via the browser. However, I don't think the built-in video players work very well (you can't easily scrub around the video without seeing lots of buffering and other issues.)