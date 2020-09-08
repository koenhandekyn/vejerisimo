bundle exec middleman build
cd build
git add . --all
git commit -am updates
git push origin master:gh-pages
git push origin master
cd ..
