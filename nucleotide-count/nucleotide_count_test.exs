if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("dna.exs")
end

ExUnit.start

defmodule DNATest do
  use ExUnit.Case, async: true

  test "empty dna string has no adenosine" do
    assert DNA.count('', ?A) == 0
  end

  test "empty dna string has no nucleotides" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    assert expected == DNA.nucleotide_counts('')
  end

  test "repetitive cytidine gets counted" do
    assert 5 == DNA.count('CCCCC', ?C)
  end

  test "repetitive sequence has only guanosine" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 8}
    assert expected == DNA.nucleotide_counts('GGGGGGGG')
  end

  test "counts only thymidine" do
    assert 1 == DNA.count('GGGGGTAACCCGG', ?T)
  end

  test "dna has no uracil" do
    assert 0 == DNA.count('GATTACA', ?U)
  end

  test "counts all nucleotides" do
    s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
    expected = %{?A => 20, ?T => 21, ?C => 12, ?G => 17}
    assert expected == DNA.nucleotide_counts(s)
  end
end
