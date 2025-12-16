require "test_helper"

class ProcessProductJobTest < ActiveJob::TestCase
  test "job is enqueued" do
    product = products(:one)  # usa fixture ou crie um produto manualmente

    assert_enqueued_with(job: ProcessProductJob, args: [product]) do
      ProcessProductJob.perform_later(product)
    end
  end
end
