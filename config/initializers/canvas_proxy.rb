hash = YAML.load_file(Rails.root.join("config", "canvas_proxy.yml"))
CanvasProxy = {}
hash.each {|k,v| CanvasProxy[k.to_sym] = v}
