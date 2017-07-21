Post.destroy_all

geoff = User.find_by(name: 'Geoff')
posts = Post.create([
  {content: "Rock the house", user: geoff}
])
