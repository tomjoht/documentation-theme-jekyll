#!/bin/sh

# Using a 'cat' here document, create a file for jekyll
# website containing what's required for tag pages.

# Pass in tag name(s)
#   ./createtag linux bsd

CMDLINEPARAM=1     #  Takes at least one param.
TAGDIR="pages/tags"

if [ $# -ge $CMDLINEPARAM ]
then
  tags=$@
else
  echo "Atleast ${CMDLINEPARAM} tag name is required."
  exit 1
fi

if [ -d "${TAGDIR}" ]; then

  echo "Creating tag(s) for ${tags}"

  for tag in ${tags}; do
  # Cannot indent here string.
cat <<EOF >"${TAGDIR}/tag_${tag}.md"
---
title: "${tag} Posts"
tagName: ${tag}
search: exclude
permalink: tag_${tag}.html
sidebar: mydoc_sidebar
hide_sidebar: true
folder: tags
---

{% include taglogic.html %}

{% include links.html %}
EOF

  done

else
  echo "Directory ${TAGDIR} doesn't exist or you are not in the top-level directory."
  echo "Please run again from the root directory of your project."
  exit 1
fi

exit
