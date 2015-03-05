---
title: Solution overview
permalink: /solution_overview/
last_updated: Mar 5, 2015
---

The following provides a solution overview for documentation.

## Authoring platform
- Jekyll (allows HTML5, CSS3, JavaScript + anything else on the web)
- author in text editor using Markdown + HTML
- take advantage of all the latest web technologies
- web platform allows UX team to contribute/integrate/develop

## Publishing

- AWS S3 storage
- tech writers push to AWS from command line
- updates immediately available

## Authentication

- each application requests access to a restful service for authentication
- service acts as a proxy

## Help inside applications
- UX devs pull help into applications from available JSON file produced by help
- tooltips, getting started pages, context-sensitive help

## Theme
- Bootstrap-based
- Sidebar and top navigation
- Search
- Syntax highlighting
- Responsive design
- Content separate from presentation

## Scalability
- Create as many sites as you need
- Accept contributions from as many authors as you want
- Authors contribute articles to HG repository, tech writers curate and publish

## Flexibility
- Brand each site with custom CSS
- Use JavaScript as needed per project or page

## Content types
- TOC for hierarchical content
- Tags for KB content
- Chronological sorting for blog content
- Collections for custom content
- include any media type: video, PDF, slides, etc.

# Costs
- Jekyll is open source
- S3 costs are absorbed by larger AWS account
- not charged per seat

## Challenges
- authentication model needs prototype
- entry point for applications without a UI?


