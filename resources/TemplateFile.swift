//
//  <%= @name %>.swift
//
//  Generated with Vulcano https://rubygems.org/gems/vulcano
//

<% if is_public then %>public <% end %><% if is_struct then %>struct<% else %>class<% end %> <%= @name %>: Codable {<% for @variable in @variables %>
    <% if is_public then %>public <% end %>var <%= @variable.name %>: <%= @variable.type %><% end %><% if (@codable_keys != nil) then %>
    
    enum CodingKeys: String, CodingKey { <% for @codable_key in @codable_keys %>
        <% if (@codable_key.codable_name != nil) then %> case <%= @codable_key.codable_name %> = "<%= @codable_key.original_name %>"<% else %> case <%= @codable_key.original_name %><% end %><% end %>
    }<% end %>
}
