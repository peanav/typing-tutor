define ['string-compare'], (StringComparer) ->
  describe 'String Comparing', ->
    it 'should return the indices where the strings do not match', ->
      diff = StringComparer.compare 'Hello', 'HEl19'
      console.log diff
      diff.length.should.equal 3
      diff[0].should.equal 1
      diff[1].should.equal 3
      diff[2].should.equal 4
