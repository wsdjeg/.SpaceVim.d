---
title: "Blog"
description: "A list of blog about the tools used by me."
---

# Blog

Here you can learn more about SpaceVim with our tutorials and find out what's
going on. 

<ul>
    {% for post in site.posts %}
            <li>
               <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
               <span class="post-date">{{ post.date | date_to_string }}</span>
               <p>{{ post.excerpt | truncatewords: 100 }}</p>
            </li>
    {% endfor %}
</ul>
