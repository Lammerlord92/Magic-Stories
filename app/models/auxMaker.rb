class AuxMaker

  validates :edges, presence: true
  validates :nodes, presence: true
  validates :idDeletedEdges, presence: true
  validates :idDeletedNodes, presence: true
  validates :storyId, presente: true

  attr_accessor :egdes, :nodes, :idDeletedEdges, :idDeletedNodes, :storyId

  def initialize(
      edges = [],
      nodes = [],
      idDeletedEdges = [],
      idDeletedNodes = [],
      storyId = nil)
    #@edges, @nodes, @idDeletedEdges, @idDeletedNodes,@storyId = edges,nodes,idDeletedEdges,idDeletedNodes,storyId
  end

end