module Reports
  class Hook < Redmine::Hook::ViewListener
    def contract_index_view(context = {})
      context[:controller].send(:render_to_string, {
        :partial => 'contracts/index',
        :locals => context
      })
    end
    render_on :contract_index_view, :partial => 'contracts/index'
  end
end