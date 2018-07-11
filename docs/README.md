# Personal website builder for the Department of Logic, Institute of Philosophy, Eötvös University (ELTE)

## Usage

### Install

Install requirements:

- GNU AWK 4.2

  Make sure your `awk` is the GNU AWK (`gawk`) implementation, and you have 
  version 4.2. You can check these with the following command:
  
  ```
  $ awk --version | head -n 1
  GNU Awk 4.2.1, API: 2.0
  ```
  
  If you have another AWK implementation or an earlier version of `gawk`, 
  install the latest patch version of `gawk` 4.2 (as of Jul 6, 2018, that's 
  4.2.1). As of Jul 6, 2018, the Ubuntu `gawk` package provides an earlier 
  version, so if you're on Ubuntu, you have to 
  [install `gawk` manually](https://www.gnu.org/software/gawk/manual/html_node/Installation.html) 
  (don't worry, it's easy, and explained in detail in the above link).
  
- Zodiac at the commit on Jan 4, 2017

  Download and extract [ZIP](https://github.com/nuex/zodiac/archive/7515f68a8d8f2f0345c80874b34eeedddd3407da.zip) 
  or [Gzipped tarball](https://github.com/nuex/zodiac/archive/7515f68a8d8f2f0345c80874b34eeedddd3407da.tar.gz).
  
  Install Zodiac: `cd` to the Zodiac directory, and run

  ```
  $ sudo make install
  ```
  
- Markdown

  Install the package providing `markdown`, e.g. on Ubuntu:

  ```
  $ sudo apt update
  $ sudo apt install markdown
  ```

Once you have installed the requirements, get the builder software itself: 
download and extract [ZIP](https://github.com/tbitai/elte-phil-logic-personal-website/archive/v0.1.0.zip) 
or [Gzipped tarball](https://github.com/tbitai/elte-phil-logic-personal-website/archive/v0.1.0.tar.gz).

Create a project directory for your website (say, `elte-phil-logic-doe-website`) 
and copy the `Makefile` and the `src` directory from the builder into it. Make 
sure you also copy the `src/.zod` subdirectory, which starts with a `.`, hence 
it's left out by default from some copy methods. Now your project directory 
should look like this:

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

You created a [Zodiac](https://github.com/nuex/zodiac) project directory, with a 
codified way of calling Zodiac in the `Makefile`, and a prepopulated source 
directory `src`. The `src/usr` directory is the place of your personal content. 
Don't modify the outer part of `src` or the `Makefile` (except of course if you 
want to [contribute](https://github.com/tbitai/elte-phil-logic-personal-website) 
to this builder software, to which you are very welcome!).

### Edit sources

Edit the example files in `src/usr`:

- `config/me.yml`: 
  - `name`: Your name. Will be displayed in the browser title and the pages' header.

- `config/menu.yml`: Data for the menu items. Ordered.

- `*.md` and `*.html` files: Sources for the pages of your website. You can write 
  your sources in [Markdown](https://daringfireball.net/projects/markdown/) or 
  raw HTML.

- `*.meta` files: Optional metadata for the page source with the same filename. 
  See `with-meta.md` and `with-meta.meta` for an example.

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

Update version in `src/builder.yml`, readme download link and `docs/_config.yml`.
