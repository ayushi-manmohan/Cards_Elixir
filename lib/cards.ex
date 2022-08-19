defmodule Cards do
   @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
   values= ["Ace","King","Queen","One","Two","Three","Four","Five"]
   suits =["Spades", "Hearts","Clubs","Diamonds"]

  #SOL 1:cards = for value <- values do
      #   for suit <- suits do
      #     "#{value} of #{suit}"
      #   end
      #  end
      #  List.flatten(cards)
  #Sol 2:
      for suit <- suits,value <- values do
          "#{value} of #{suit}"
      end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end


   # Determines whether a deck contains a given card
  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

    @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.
  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck,hand) do
    Enum.split(deck,hand)
  end

  def save(deck,filename) do
    binary= :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)
    case status do
        :ok -> :erlang.binary_to_term(binary)
        :error -> "File does not exist!"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
