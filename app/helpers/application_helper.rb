module ApplicationHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
	end
	
	def nav_items
	  	[
			{
			 displaytext: 'Manage Accounts',
			 controllername: 'admin/administrators',
			 linkurl: manage_accounts_admin_administrator_path(:id => current_user.id)
			},
			{
			 displaytext: 'Manage Customers',
			 controllername: 'admin/administrators',
			 linkurl: manage_customers_admin_administrator_path(:id => current_user.id)
			},
			{
			 displaytext: 'Manage Transactions',
			 controllername: 'admin/administrators',
			 linkurl: manage_acct_transactions_admin_administrator_path(:id => current_user.id)
			},
			{
			 displaytext: 'Manage Equities',
			 controllername: 'admin/administrators',
			 linkurl: manage_equities_admin_administrator_path(:id => current_user.id)
			}
		]
	end

	def display_nav_item(displaytext, controllername, linkurl)
		raw("<li#{controller_name == controllername ? ' class="active"' : ''}>#{link_to displaytext, linkurl}</li>")
	end
	
end
