#Jeff Tucker's Resume
## Introduction
This is a simple Sinatra application to show my resume and some simple contact info.  You can see it live at [resume.trydionel.com](http://resume.trydionel.com).

## Technique
The actual resume info sites in `data.yaml`. `resume.rb` parses this file for the sections and keyword info and fills out the appropriate partials.  Done.

## TODO
* Need better handling for single-child sections (e.g., Objective)
* Move contact info from HTML partial to YAML data file
* Need some fallback styles for browsers that don't support latest-and-greatest CSS3
* Looks like ass in every version of IE