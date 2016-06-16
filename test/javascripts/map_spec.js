describe("Using fixtures", function() {

  var originalInitMap;
  var server;
  var sites = [{ id: 1, name: "Gault Site",
                longitude: "65.4440",
                latitude: "-34.5667788" }]

  beforeEach(function() {
    originalInitMap = window.initMap;
    server = sinon.fakeServer.create();
  });

  afterEach(function() {
    window.initMap = originalInitMap;
    server.restore();
  });

  it("allows loads fixtures", function() {
    var initMapCalled = false,
        initMapSites = null;

    // expect(true).to.eq(true);
    window.renderMap()
    window.initMap = function(sites) {
      initMapCalled = true;
      initMapSites = sites;
    }

    server.requests[0].respond(
        200,
        { "Content-Type": "application/json" },
        JSON.stringify(sites)
    );

    expect(initMapCalled).to.eq(true);
    expect(initMapSites).to.eql(sites)
  })
})
