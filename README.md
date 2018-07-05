# Personal website builder for the Department of Logic, Eötvös University (ELTE)

## Usage

### Install

Install requirements:

- GNU AWK

  Make sure your `awk` is GNU AWK. This can be achieved by installing the `gawk` 
  package. E.g. on Ubuntu:

  ```
  $ sudo apt update
  $ sudo apt install gawk
  ```
  
  Check that `awk` now links to `gawk`:
  
  ```
  $ which awk
  /usr/bin/awk
  $ ls -l /usr/bin/awk
  lrwxrwxrwx 1 root root 21 febr  10 10:21 /usr/bin/awk -> /etc/alternatives/awk
  $ ls -l /etc/alternatives/awk
  lrwxrwxrwx 1 root root 13 máj   21 13:27 /etc/alternatives/awk -> /usr/bin/gawk
  ```
  
  Note that in the end of the link chain, the filename is `gawk`; this is what 
  we need. 
  
- [Zodiac](http://nu-ex.com/projects/zodiac.html) at the commit on Jan 4, 2017

  Download and extract [ZIP](https://github.com/nuex/zodiac/archive/7515f68a8d8f2f0345c80874b34eeedddd3407da.zip).
  
  Install Zodiac: `cd` to the Zodiac directory, and run

  ```
  $ sudo make install
  ```
  
- [Markdown](https://daringfireball.net/projects/markdown/)

  Install the package providing `markdown`, e.g. on Ubuntu:

  ```
  $ sudo apt update
  $ sudo apt install markdown
  ```

Once you have installed the requirements, get the builder software itself: 
download and extract this [ZIP](https://github.com/tbitai/elte-phil-logic-personal-website/archive/v0.1.0.zip).

### Setup

Create a project directory for your website and copy the `Makefile` and the `src` 
directory from the builder into it. Make sure you also copy the `src/.zod` 
subdirectory, which starts with a `.`, hence it's left out by default from some 
copy methods. Now your project directory should look like this:

```
elte-phil-logic-doe-website
├── Makefile
└── src
    ├── builder.yml
    ├── helpers.awk
    ├── main.layout
    ├── menu.tpl
    ├── server.yml
    ├── usr
    │   ├── config
    │   │   ├── menu.yml
    │   │   └── me.yml
    │   ├── index.md
    │   ├── publications.md
    │   ├── raw.html
    │   ├── subdirectory
    │   │   └── index.md
    │   ├── with-meta.md
    │   └── with-meta.meta
    └── .zod
        └── config
```

### Edit sources

Edit the example files in `src/usr`:

- `config/me.yml`: 
  - `name`: Your name. Will be displayed in the browser title and the pages' header.

- `config/menu.yml`: Data for the menu items. Ordered.

- `*.md` and `*.html` files: Sources for the pages of your website.

- `*.meta` files: Optional metadata for the page source with the same filename.

### Build

In the site project directory (`elte-phil-logic-doe-website` in the above example), 
run

```
$ make
```

This calls Zodiac, and generates your HTML pages into `site/usr`. Go check them 
out! 

### Upload

If the generated site looks good, upload it to the server.

## Development

### Test with local CDN

Build with `LOCAL_CDN=1`.

### Bump version

Update version in `src/builder.yml` and readme download link.
