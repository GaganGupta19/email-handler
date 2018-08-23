require 'fetch_mail'

describe FetchMail do
  context "if settings are correctly entered" do
    m = MailBox.create(email: 'horribledevelopers@gmail.com', password: '9811096838', imap_address: 'imap.gmail.com')
    fetch_mail = FetchMail.new(m.email, m.password, m.imap_address, m.id)

    it "should initialize correctly" do
      expect(fetch_mail).to_not equal nil
    end

    it "should login" do
      expect(fetch_mail.login).to eq true
    end

    it "should have emails in inbox" do
      ids = fetch_mail.fetch_all_ids
      expect(ids.count).to_not equal 0
    end

    it "should fetch the email data" do
      ids = fetch_mail.fetch_all_ids
      data = fetch_mail.fetch_data(ids[0])
      expect(data).to_not equal nil
    end

    it "should logout" do
      expect(fetch_mail.destroy_imap).to eql('logged out successfully')
    end
  end
end