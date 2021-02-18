require 'rails_helper'


RSpec.describe "/phones", type: :request do

  let(:contact) { Contact.create(name: "Clods", email: "clods@gmail.com") }

  let(:valid_attributes) {
    {phone_number: "(61) 8187-9197", contact_id: contact.id}
  }

  let(:invalid_attributes) {
    {phone_number: nil, contact_id: contact.id}
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Phone.create! valid_attributes
      get api_v1_phones_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      phone = Phone.create! valid_attributes
      get api_v1_phone_url(phone), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Contact" do
        expect {
          post api_v1_phones_url,
               params: {phone: valid_attributes}, headers: valid_headers, as: :json
        }.to change(Phone, :count).by(1)
      end

      it "renders a JSON response with the new phone" do
        post api_v1_phones_url,
             params: {phone: valid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including(""))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Contact" do
        expect {
          post api_v1_phones_url,
               params: {phone: invalid_attributes}, as: :json
        }.to change(Phone, :count).by(0)
      end

      it "renders a JSON response with errors for the new phone" do
        post api_v1_phones_url,
             params: {phone: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "Waliff", email: "waliff@gmail.com"}
      }

      it "updates the requested phone" do
        phone = Phone.create! valid_attributes
        patch api_v1_phone_url(phone),
              params: {phone: new_attributes}, headers: valid_headers, as: :json
        phone.reload
        {name: "Clodoaldo", email: "clodoaldo@gmail.com"}
      end

      it "renders a JSON response with the phone" do
        phone = Phone.create! valid_attributes
        patch api_v1_phone_url(phone),
              params: {phone: new_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the phone" do
        phone = Phone.create! valid_attributes
        patch api_v1_phone_url(phone),
              params: {phone: invalid_attributes}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested phone" do
      phone = Phone.create! valid_attributes
      expect {
        delete api_v1_phone_url(phone), headers: valid_headers, as: :json
      }.to change(Phone, :count).by(-1)
    end
  end
end
