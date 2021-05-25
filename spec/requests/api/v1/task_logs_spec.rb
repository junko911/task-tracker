require 'rails_helper'

RSpec.describe "Api::V1::TaskLogs", type: :request do
  let(:result) { JSON.parse(response.body) }
  let!(:user) { User.create(email: "test@gmail.com", password: "123456", password_confirmation: "123456") }
  let!(:task_log) { TaskLog.create(task: task, user: user, duration_minutes: 10) }
  let!(:task) { Task.create(project: project, description: "Task description") }
  let!(:project) { Project.create(customer: customer, name: "Project name") }
  let!(:customer) { Customer.create(name: "Customer name") }

  before do
    allow(Tokenizer).to receive(:decode)
      .and_return(user)
  end

  describe "GET /api/v1/tasks/:task_id/task_logs" do
    it "returns all task_logs" do
      get api_v1_task_task_logs_path(task)

      expect(response).to have_http_status(200)
      expect(result[0]["duration_minutes"]).to eq(10)
    end
  end

  describe "POST /api/v1/tasks/:task_id/task_logs" do
    it "creates task_log" do
      expect {
        post api_v1_task_task_logs_path(task), params: { task_log: { duration_minutes: 10 } }
      }.to change(TaskLog, :count).by(1)
    end
  end
end
