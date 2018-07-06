{ helpers = "yes"; }

function load_helpers(    local_cdn, me, server, depth, i, root, builder) {
    local_cdn = ENVIRON["LOCAL_CDN"];
    yaml_load_map(getlines("src/usr/config/me.yml"), me);
    yaml_load_map(getlines("src/server.yml"), server);
    depth = length(FILENAME) - length(gensub(/\//, "", "g", FILENAME)) \
            - 2;  # Account for "src/usr/".
    root = ".";
    for (i = 1; i <= depth; i++)
        root = root "/..";
    yaml_load_map(getlines("src/builder.yml"), builder);
    
    data["name"] = me["name"];
    data["root"] = root;
    data["cdn"] = local_cdn ? root "/../../cdn/dist" : server["url"] "/bitai/cdn";
    data["builder"] = builder["name"];
    data["builder_version"] = builder["version"];
    data["menu"] = menu(server, root);
}

function getlines(file,    line, lines) {
    while ((getline line < file) > 0) {
        if (lines) {
            lines = lines "\n" line;
        } else {
            lines = line;
        }
    }
    close(file);
    return lines;
}

function yaml_load_map(yaml, map,    items, i, kv) {
    delete map;
    split(yaml, items, /\s*[,\n]\s*/);
    for (i in items) {
        split(items[i], kv, /\s*:\s+/);
        map[kv[1]] = kv[2];
    }
}

function yaml_load_seq(yaml, seq,    items, i) {
    delete seq;
    split(yaml, seq, /\n/);
    for (i in seq) {
        seq[i] = gensub(/^-\s+/, "", "g", seq[i]);
    }
}

function menu(server, root,    template, data, items, item, key, parts, m,
              name_re, url_re, i) {
    # Read template and data.
    template = getlines("src/menu.tpl");
    yaml_load_seq(getlines("src/usr/config/menu.yml"), items);
    for (i = 1; i in items; i++) {
        yaml_load_map(items[i], item);
        for (key in item)
            data[i][key] = item[key];
    }

    # Extract loop part.
    match(template, /^(.*)\{foreach \$menu as \$item\}(.*)\{\/foreach\}(.*)$/, parts);
    
    m = parts[1];
    
    # Loop and bind data.
    name_re = @/\{\$item\.name\}/;
    url_re = @/\{\$item\.url\}/;
    for (i = 1; i in data; i++)
        m = m gensub(name_re, data[i]["name"], "g",
                     gensub(url_re, root data[i]["url"], "g", parts[2]));
    m = m gensub(name_re, "Department home", "g",
                 gensub(url_re, server["url"] "/logic", "g", parts[2]));
                 
    m = m parts[3];
    
    return m;
}
