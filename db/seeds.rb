Article.create(:title => "Foo", :content => "bar")

["A", "B", "C"].each do |l|
  Author.create(:first_name => l)
end