---
title: Setting up iTerm Profiles 
permalink: /iterm_profiles/
tags: []
keywords: 
audience: 
last_updated: May 13, 2015
summary: "Set up profiles in iTerm to facilitate the build process. This can make it a lot easier to quickly build multiple outputs."
---
{% include linkrefs.html %} 

When you're working with tech docs, a lot of times you're single sourcing multiple outputs. It can be a hassle to fire up each one of these outputs using the build files containing the shell scripts. Instead, it's easier to configure iTerm with profiles that initiate the scripts.

## Set up profiles

1. Open iTerm and go to **Profiles > Open Profiles.**
2. Click **Edit Profiles**.
3. Click the + button in the lower-left corner to create a new profile.
4. In the **Name** field, type a name describing the output, such as `Doc theme -- designers`.
5. In the **Send text at start** field, type the command for the build script, such as this:

```
. build_designer.sh
```
 Leave the Login shell option selected.
 
6. In the Working Directory section, select **Directory** and enter the directory for your project, such as **/Users/tjohnson/projects/documentation-theme-jekyll**.
7. Close the profiles panel. 

## Launching a profile

1. Make sure the Toolbar is shown. Go to **View > Toggle Toolbar**.
2. Click the **New** button and select your profile.

{{tip}} When you're done with the session, make sure to click **Ctrl+C**.{{end}}