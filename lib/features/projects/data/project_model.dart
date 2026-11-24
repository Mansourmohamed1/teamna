
class ProjectModel {
  final String title;
  final String category;
  final String age;
  final String description;
  final String match;
  final List<String> roles;
  final int members;
  final int totalMembers;
  final String commitment;
  final String leader;
  final bool verified;
  final List<String> stack;
  final List<ProjectRole> openRoles;

  const ProjectModel({
    required this.title,
    required this.category,
    required this.age,
    required this.description,
    required this.match,
    required this.roles,
    required this.members,
    required this.totalMembers,
    required this.commitment,
    required this.leader,
    required this.verified,
    required this.stack,
    required this.openRoles,
  });
}

class ProjectRole {
  final String title;
  final String commitment;
  final bool filled;
  const ProjectRole(this.title, this.commitment, {this.filled = false});
}

const demoProjects = <ProjectModel>[
  ProjectModel(
    title: 'Campus Carpool',
    category: 'DEPI',
    age: '2h ago',
    description:
        'Share rides between students with live routes and verified drivers.',
    match: '92% match',
    roles: ['Flutter Dev', 'Back-End'],
    members: 3,
    totalMembers: 5,
    commitment: '10h / week',
    leader: 'Sara Mostafa',
    verified: true,
    stack: ['Flutter', 'Firebase', 'BLoC', 'Google Maps'],
    openRoles: [
      ProjectRole('Flutter Developer', '10h / week'),
      ProjectRole('Back-End Engineer', '8h / week'),
      ProjectRole('UI/UX Designer', 'Filled', filled: true),
    ],
  ),
  ProjectModel(
    title: 'Souq Local',
    category: 'ITI',
    age: '3d ago',
    description:
        'A marketplace that helps neighborhood shops sell online in minutes.',
    match: '81% match',
    roles: ['Back-End', 'Flutter Dev'],
    members: 3,
    totalMembers: 6,
    commitment: '12h / week',
    leader: 'Youssef Tarek',
    verified: true,
    stack: ['Flutter', 'Node.js', 'MongoDB'],
    openRoles: [
      ProjectRole('Back-End Engineer', '12h / week'),
      ProjectRole('Flutter Developer', '10h / week'),
    ],
  ),
  ProjectModel(
    title: 'Mostaqbal Health',
    category: 'NTI',
    age: '1d ago',
    description:
        'A simple platform connecting patients with nearby healthcare providers.',
    match: '87% match',
    roles: ['UI/UX', 'Flutter Dev'],
    members: 2,
    totalMembers: 5,
    commitment: '8h / week',
    leader: 'Mariam Adel',
    verified: false,
    stack: ['Flutter', 'Firebase', 'Figma'],
    openRoles: [
      ProjectRole('Flutter Developer', '8h / week'),
      ProjectRole('QA Engineer', '5h / week'),
    ],
  ),
];
