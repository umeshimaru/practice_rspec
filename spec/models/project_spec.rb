require 'rails_helper'

RSpec.describe Project, type: :model do
  it "does not allow duplicate project names per user" do
    user = User.create(
      first_name: "Joe",
      last_name:  "Tester",
      email:      "joetester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )

    user.projects.create(
      name: "Test Project",
    )

    new_project = user.projects.build(
      name: "Test Project",
    )

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end



# 遅延ステータス describe"latestatus"do
# 締切日が過ぎていれば遅延していること
it "is late when the due date is past today" do
    project = FactoryBot.create(:project_due_yesterday)
    expect(project).to be_late 
    end
    
# 締切日が今日ならスケジュールどおりであること
it "is on time when the due date is today" do
    project = FactoryBot.create(:project_due_today)
    expect(project).to_not be_late 
end

# 締切日が未来ならスケジュールどおりであること
it "is on time when the due date is in the future" do
   project = FactoryBot.create(:project_due_tomorrow)
   expect(project).to_not be_late
end

 it "allows two users to share a project name" do
    user = User.create(
      first_name: "Joe",
      last_name:  "Tester",
      email:      "joetester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )

    user.projects.create(
      name: "Test Project",
    )

    other_user = User.create(
      first_name: "Jane",
      last_name:  "Tester",
      email:      "janetester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )

    other_project = other_user.projects.build(
      name: "Test Project",
    )

    expect(other_project).to be_valid


end

 
  end

