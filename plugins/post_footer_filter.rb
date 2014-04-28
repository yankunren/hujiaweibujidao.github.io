# post_footer_filter.rb
# Append every post some footer infomation like original url 
# Kevin Lynx
# 7.26.2012
#
require './plugins/post_filters'

module AppendFooterFilter
        def append(post)
                author = post.site.config['author']
                url = post.site.config['url']
                pre = post.site.config['original_url_pre']
                post.content + %Q[<p class='post-footer'>
                        #{pre or "Original link:"}<a href='#{post.full_url}'>#{post.full_url}</a><br/>Written by <a href='#{url}'>#{author}</a>&nbsp;Posted at <a href='#{url}'>#{url}</a><br/>Feel free to read or comment it, and if you want to copy it into your own site, please copy it with its Original Link showed above or you can see the license below for more details.<br />Thanks a lot. Hope you enjoy here! :-)</p>]
        end
end

module Jekyll
        class AppendFooter < PostFilter
                include AppendFooterFilter
                def pre_render(post)
                        post.content = append(post) if post.is_post?
                end
        end
end

Liquid::Template.register_filter AppendFooterFilter