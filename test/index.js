const chakram = require('chakram')
const expect = chakram.expect

describe('autosuggest', () => {
  it("abc returns bar", async () => {
    const response = await chakram.get('http://service/autosuggest/all/madon')
    console.log('response: ', response)
    expect(response).to.have.status(200)
    await expect(response).to.comprise.of.json({
      suggestions: [
        {
          artist: 'Madonna'
        }
      ]
    })
    return chakram.wait();
  })
})
