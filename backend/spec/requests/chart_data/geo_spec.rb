require 'rails_helper'
RSpec.describe 'ChartData', type: :request do
  let(:headers) { {} }
  let(:params)  { {} }
  let(:action) { get url, params: params, headers: headers }
  let(:state_codes) { %w[BW BY BE BB HB HH HE MV NI NW RP SL ST SN SH TH] }

  describe 'GET' do
    describe 'chart_data/geo/geojson' do
      let(:url) { '/chart_data/geo/geojson' }
      let(:geojson) { RGeo::GeoJSON.decode(response.body, json_parser: :json) }
      subject do
        action
        geojson
      end

      it 'returns state codes for all federal states' do
        response_state_codes = subject.collect { |feature| feature.properties['state_code'] }
        expect(response_state_codes).to eq(state_codes)
      end

      context 'given users for all federal states of germany' do
        let(:users) do
          state_codes.each_with_index do |state_code, i|
            create_list(:user, i, country_code: 'DE', state_code: state_code)
          end
        end
        before { users }

        it 'returns counts for all federal states' do
          counts = subject.collect { |feature| feature.properties['user_count_total'] }
          expect(counts).to eq((0..15).to_a)
        end

        it 'returns normalized counts for all federal states' do
          normalized_counts = subject.collect { |feature| feature.properties['user_count_normalized'] }
          expect(normalized_counts).to all(be_between(0, 1))
        end
      end
    end
  end
end
