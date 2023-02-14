defmodule SkeletonWeb.Live.ExampleLive do

  use Surface.LiveView

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button>Moon button</Button>
    <button>Regular button</button>
    """
  end
end
