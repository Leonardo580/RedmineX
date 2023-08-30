module ContractsHelper
  include ProjectsHelper
  def render_contract_hierarchy(contracts)
    bookmarked_project_ids = User.current.bookmarked_project_ids
    projects = Project.all

    render_project_nested_lists(projects) do |project|
      render_project_link(project, bookmarked_project_ids)
    end
  end

  def render_project_link(project, bookmarked_project_ids)
    classes = project.css_classes.split
    classes << 'icon icon-user my-project' if User.current.member_of?(project)
    classes << 'icon icon-bookmarked-project' if bookmarked_project_ids.include?(project.id)

    contract = Contract.find_by_project_id(project)
    link_content = contract.present? ? link_to(project, rlog_path(contract)) : link_to_project(project, {})

    link_content.html_safe
  end

  def get_projects(contacts)
      project= []
      contacts.each do |contact|
        project << contact.project
      end
      project
  end
  def get_contract_by_project(project)
    Contract.find_by project_id: project
  end

end
