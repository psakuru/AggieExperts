seed_status = [{:code => 'PACT', :description => 'Pending Activation', :entity => 'SUSER'},{:code => 'DISABLE', :description => 'Disabled', :entity => 'USER'},
{:code => 'PAPP', :description => 'Pending Approval', :entity => 'USER'},{:code => 'ACTIVE', :description =>'Active', :entity => 'USER'},{:code => 'REQ', :description =>'Request Invite', :entity => 'SUSER'},{:code => 'RESET', :description => 'Password Reset Requested', :entity => 'SUSER'}
]

seed_status.each do |status|
    Status.create!(status)
end

seed_uroles = [{:code => 'ADMIN',:description => 'System Administrator'},{:code => 'USER', :description => 'Aggie Expert User'}]

seed_uroles.each do |urole|
    Urole.create!(urole)
end

seed_users = [
{:email=>'xavier@tamu.edu', :encrypted_password =>'$2a$10$4nxeKbBQIUJsNMBvXW6MaehP9X2ewwXr6YU7.HDMagqe8s3.PpVrm', :status_id=>4, :urole_id=> 2},
{:email=>'samuel@tamu.edu',:encrypted_password =>'$2a$10$XqWFr8Omw4OTh9PQfVLau.oujuzBU.mYhUsC/S6ko.SR7cc2mmOm6', :status_id=>4, :urole_id=> 2},
{:email=>'singh@tamu.edu',:encrypted_password =>'$2a$10$wLaDs5v1oSeFHtvf8lI78OOE1KrOcThwhkiggn3nzPHnh2ktgBNlS', :status_id=>4, :urole_id=> 2},
{:email=>'patterson@tamu.edu',:encrypted_password =>'$2a$10$L/8mSlxCIZhpfZGM8P9IVOyxV3trjS.dm01xzZrwoBVUAtyLVQy22', :status_id=>4, :urole_id=> 2},
{:email=>'fox@tamu.edu',:encrypted_password =>'$2a$10$fMwSit9vogMTQpQAEPUeDOSuEqu83h2EkjE9V7qHtq28PYP1/Gw/G', :status_id=>4, :urole_id=> 2},
{:email=>'admin@tamu.edu',:encrypted_password =>'$2a$10$tkUo0TBvOI5nWaYnpHWNXeBAYCKkX8YTyQEgyN4gJrgp2lhfxWx6u',  :urole_id=> 1}
]


seed_users.each do |user|
    User.create!(user)
end



seed_keywords = [{:key => "antiquity"},
                 {:key => "medieval"},
                 {:key => "enlightenment"},
                 {:key => "modern"},
                 {:key => "communism"},
                 {:key => "democracy"},
                 {:key => "democratic"},
                 {:key => "republican"},
                 {:key => "libertarian"}]

seed_keywords.each do |keyword|
    Keyword.create!(keyword)
end


seed_profiles = [{:user_id => 1, 
                  :name =>'Charles Xavier',
                  :description=>'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                  :phone=> 9790001122,
                  :email=> 'xavier@tamu.edu',
                  :title=> 'Dr.',
                  :website => 'https://www.google.com'},
                 {:user_id => 2, 
                  :name =>'John Samuel', 
                  :description=>'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.',
                  :phone=> 9790002233,
                  :email=> 'samuel@tamu.edu',
                  :title=> 'Prof.',
                  :website => 'https://www.google.com'},
                 {:user_id => 3, 
                  :name =>'Jacob Singh', 
                  :description=>'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat',
                  :phone=> 9790004455,
                  :email=> 'singh@tamu.edu',
                  :title=> 'Mr.',
                  :website => 'https://www.google.com'},
                 {:user_id => 4, 
                  :name =>'Armando Patterson', 
                  :description=>'sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                  :phone=> 9790001122,
                  :email=> 'patterson@tamu.edu',
                  :title=> 'Miss'},
                 {:user_id => 5, 
                  :name =>'David Fox', 
                  :description=>' et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed',
                  :phone=> 9790001122,
                  :email=> 'fox@tamu.edu',
                  :title=> 'Mrs.'}]

i = 1
seed_profiles.each do |profile|
    p = Profile.new(profile)
    path = Rails.root.to_s + "/app/assets/images/profile_photo#{i.to_s}.jpg"
    p.pic = File.open(path)
    p.save!
    i = i + 1
end                  


seed_pkeywords = [
                   {:user_id => 1, :keyword_id => 1},
                   {:user_id => 1, :keyword_id => 2},
                   {:user_id => 1, :keyword_id => 3},
                   {:user_id => 1, :keyword_id => 4},
                   {:user_id => 1, :keyword_id => 5},
                   {:user_id => 2, :keyword_id => 1},
                   {:user_id => 2, :keyword_id => 3},
                   {:user_id => 2, :keyword_id => 5},
                   {:user_id => 2, :keyword_id => 6},
                   {:user_id => 2, :keyword_id => 7},
                   {:user_id => 2, :keyword_id => 8},
                   {:user_id => 3, :keyword_id => 1},
                   {:user_id => 3, :keyword_id => 2},
                   {:user_id => 3, :keyword_id => 3},
                   {:user_id => 3, :keyword_id => 5},
                   {:user_id => 3, :keyword_id => 6},
                   {:user_id => 3, :keyword_id => 7},
                   {:user_id => 3, :keyword_id => 8},
                   {:user_id => 3, :keyword_id => 9},
                   {:user_id => 4, :keyword_id => 3},
                   {:user_id => 5, :keyword_id => 1},
                   {:user_id => 5, :keyword_id => 3},
                   {:user_id => 5, :keyword_id => 4},
                   {:user_id => 5, :keyword_id => 7},
                 ]


seed_pkeywords.each do |pkeyword|
    Pkeyword.create!(pkeyword)
end

seed_publications = [
    {:user_id => 1, :title =>'FlowDroid: Precise Context, Flow, Field, Object-sensitive and Lifecycle-aware Taint Analysis for Android Apps', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'A Few Billion Lines of Code Later: Using Static Analysis to Find Bugs in the Real World', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'Parallel Programming Must Be Deterministic by Default', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'Line-Up: A Complete and Automatic Linearizability Checker', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'PARROT: A Practical Runtime for Deterministic, Stable, and Reliable Threads', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'Static and dynamic analysis: synergy and duality', :url=>'http://www.pub1.com'},
]

seed_publications.each do |pub|
  Ppublication.create!(pub)
end
