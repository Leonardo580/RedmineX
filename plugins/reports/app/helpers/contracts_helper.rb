module ContractsHelper
  include ProjectsHelper
  def render_contract_hierarchy(contracts)
    bookmarked_project_ids = User.current.bookmarked_project_ids
    # projects= get_projects(contracts)
    projects= Project.all
    render_project_nested_lists(projects) do |project|
      classes = project.css_classes.split
      classes += %w(icon icon-user my-project) if User.current.member_of?(project)
      classes += %w(icon icon-bookmarked-project) if bookmarked_project_ids.include?(project.id)
      contract=Contract.find_by_project_id(project)
      s=''
      if contract.present?
      s = link_to project, rlog_path(contract), :class => classes.uniq.join(' ')
      else
        s = link_to_project(project, {}, :class => classes.uniq.join(' '))
      end
=begin
      if project.description.present?
        s << content_tag('div', textilizable(project.short_description, :project => project), :class => 'wiki description')
      end
=end
      s
    end
  end
    def get_projects(contacts)
      project= []
      contacts.each do |contact|
        project << contact.project
      end
      project
    end

end
