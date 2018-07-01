module ApplicationHelper
  def pagination_links(pages, opts = {})
    default_opts = {
      class: "pagination",
      previous_label: "&lt;".html_safe,
      next_label: "&gt;".html_safe,
      inner_window: 1,
      outer_window: 0
    }
    will_paginate(pages, default_opts.merge(opts))
  end
end
