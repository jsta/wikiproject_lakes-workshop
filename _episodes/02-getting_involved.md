---
title: "Creating and editing pages"
questions:
- "What can I do if a page is missing or incomplete?"
objectives:
- "Learn how to add fixes or add new pages."
keypoints:
- ""
---



### Sections of a Wikipedia page

* Infobox

* Text body

### Preview a minor page fix

> ## Add a (pushpin) map to [Elk Lake (British Columbia)](https://en.wikipedia.org/wiki/Elk_Lake_(British_Columbia))
> Many lakes are ambiguously named. One of simplest and most useful improvements you can make to a lake page is to add a map.
> ```
> | pushpin_map = British Columbia
> ```
{: .challenge}

> ## Add a missing field
> See the [lake Infobox template](https://en.wikipedia.org/wiki/Template:Infobox_body_of_water).
{: .challenge}

> ## Add a reference from a:
> ### Scientific paper
> 
> * _freeform_
> 
> ```
> The lake is big <ref name = "lakeperson2017">Lakeperson, T. 2017. A lake paper. Lake Journal</ref>.
> ```
> 
> ### Web page
> 
> * _minimum title and url_
> 
> ```
> {% raw %}
> The lake is small <ref name="somewebsite">{{cite web|title=somewebsite|url=http://www.somewebsite.org}}</ref>.
> {% endraw %}
> ```
> 
> ### Reusing a reference
> 
> ```
> The lake is a medium size <ref name = "somewebsite"/>.
> ```
{: .challenge}

See [Wikipedia:Citing sources](https://en.wikipedia.org/wiki/Wikipedia:Citing_sources) for more information.

## Create a new page
