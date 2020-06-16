module ApplicationHelper
  PHASE_MAP = {
    'tests_index' => 'builds',
    'tests_new'  => 'new_build',
    'home_show' => 'users',
    'tests_configure' => 'config'
  }

  def phase(name)
    PHASE_MAP["#{controller_name}_#{action_name}"] == name
  end
end
