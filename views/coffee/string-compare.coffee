define ['lib/underscore'], (_) ->
  compare = (one, two) ->
    max = Math.max(one.length, two.length)
    parts = []
    for i in [0..max-1] by 1
      parts.push [one.charAt(i), two.charAt(i)]
    _.reduce(parts, (memo, part, index) ->
      memo.push index unless part[0] == part[1]
      memo
    , [])

  return {
    compare: compare
  }
