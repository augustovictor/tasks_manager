Category.destroy_all
Category.find_or_create_by_name(name: 'interface')
Category.find_or_create_by_name(name: 'development')
Category.find_or_create_by_name(name: 'planning')
Category.find_or_create_by_name(name: 'bug')
Category.find_or_create_by_name(name: 'fix')
