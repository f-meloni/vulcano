//
//  <%= @name %>.swift
//
//  Generated with Vulcano https://rubygems.org/gems/vulcano
//

class <%= @name %>: Codable {<% for @variable in @variables %>
    var <%= @variable.name %>: <%= @variable.type %><% end %><% if (@codable_keys != nil) then %>
    
    enum CodingKeys: String, CodingKey { <% for @codable_key in @codable_keys %>
        <% if (@codable_key.codable_name != nil) then %> case <%= @codable_key.codable_name %> = "<%= @codable_key.original_name %>"<% else %> case <%= @codable_key.original_name %><% end %><% end %>
    }<% end %>
}
