defmodule Example2Web.FeedChannel do
  use Phoenix.Channel

  alias Example2.Activity

  def join("feed", _params, socket) do
    {:ok, socket}
  end

  def handle_in("fetch", params, socket) do
    payload = %{activities: all_activities(params)}

    # TODO: This is not replying to the fetch command correctly, causing a crash. Return a successful
    # response so that the client is responded to with the payload above.
    nil
  end

  # TODO: The function for create_activity is purposefully left out. Try implementing it to these specs:
  #   * Accept the params from the user
  #   * Create the Activity using the context API only (don't reach into the database layer directly)
  #   * If successful, return a successful reply with the activity
  #   * If error, reply with some message indicating that there's invalid data. This can be done with
  #     :error status instead of :ok
  #   * Fix the error that will come up after you do this (due to missing occurred_at). Do this completely
  #     in the Channel by add a valid DateTime to the params map.

  # def handle_in("create_activity", params, socket) do
  # end

  defp all_activities(params) do
    Activity.all(params)
  end
end
