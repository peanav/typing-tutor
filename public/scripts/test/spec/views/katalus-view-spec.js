define(['views/katalus-view'], function(View) {
  describe('Katalus View', function() {
    var view;

    before(function() {
      view = new View();
    });

    it('should be a header', function() {
      view.tagName.should.equal('header');
    });
  });
});
