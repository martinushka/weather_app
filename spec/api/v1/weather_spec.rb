require 'rails_helper'

describe ::V1::Weather do 
	context 'get current temperature' do
		let(:path) { '/api/v1/weather/current' }

		subject do
			get path
			response
		end

		it 'with success and return json' do
			client = double('hello ruby')

			res = { 'WeatherText': 'Party cloudy', 'Metric': {
				'Value': 22.0, 'Unit': 'C', 'UnitType': 17
			}}

			expect(::AccueWeather::Client).to receive(:new)
									.and_return(client)

				expect(client).to receive_message_chain(:uniq_id, :uniq_id)
									.and_return('5643434')

				expect(client).to receive(:current_temperature).
									and_return(::AccueWeather::APIResponse.new(res))

				is_expected.to be_successful
				expect(response.status).to eq(200)
		end

	context 'get hourly temperature for the last 24 hours' do
		let(:path) { '/api/v1/weather/historical' }

		subject do
			get path
			response
		end		

		it 'with success and return json' do
			client = double('hello ruby')

			res = {
				body: [
					{
						'WeatherText' => 'Party cloudy',
						'EpochTime'=> 1_677_751_080,
						'Temperature'=> {
							'Metric': {
								'Value': 22.0, 'Unit': 'C', 'UnitType': 17
							}
						}
					}
				]
			}

			expect(::AccueWeather::Client).to receive(:new)
					.and_return(client)

				expect(client).to receive_message_chain(:uniq_id, :uniq_id)
					.and_return('5643434')

				expect(client).to receive(:historical_temperature)
					.and_return(::AccueWeather::APIResponse.new(res))

				is_expected.to be_successful
				expect(response.status).to eq(200)
			end
		end

		context 'get max temperature for the last 24 hours' do
		let(:path) { '/api/v1/weather/historical/max' }

		subject do
			get path
			response
		end		

		it 'with success and return json' do
			client = double('hello ruby')

			res = {
				body: [
					{
						'WeatherText' => 'Party cloudy',
						'EpochTime'=> 1_677_751_080,
						'Temperature'=> {
							'Metric': {
								'Value': 22.0, 'Unit': 'C', 'UnitType': 17
							}
						}
					}
				]
			}

			expect(::AccueWeather::Client).to receive(:new)
					.and_return(client)

				expect(client).to receive_message_chain(:uniq_id, :uniq_id)
					.and_return('5643434')

				expect(client).to receive(:historical_temperature)
					.and_return(::AccueWeather::APIResponse.new(res))

				is_expected.to be_successful
				expect(response.status).to eq(200)
			end
		end

		context 'get min temperature for the last 24 hours' do
		let(:path) { '/api/v1/weather/historical/min' }

		subject do
			get path
			response
		end		

		it 'with success and return json' do
			client = double('hello ruby')

			res = {
				body: [
					{
						'WeatherText' => 'Party cloudy',
						'EpochTime'=> 1_677_751_080,
						'Temperature'=> {
							'Metric': {
								'Value': 22.0, 'Unit': 'C', 'UnitType': 17
							}
						}
					}
				]
			}

			expect(::AccueWeather::Client).to receive(:new)
					.and_return(client)

				expect(client).to receive_message_chain(:uniq_id, :uniq_id)
					.and_return('5643434')

				expect(client).to receive(:historical_temperature)
					.and_return(::AccueWeather::APIResponse.new(res))

				is_expected.to be_successful
				expect(response.status).to eq(200)
			end
		end

		context 'get avg temperature for the last 24 hours' do
		let(:path) { '/api/v1/weather/historical/avg' }

		subject do
			get path
			response
		end		

		it 'with success and return json' do
			client = double('hello ruby')

			res = {
				body: [
					{
						'WeatherText' => 'Party cloudy',
						'EpochTime' => 1_677_751_080,
						'Temperature' => {
							'Metric' => {
								'Value' => 22.0, 'Unit': 'C', 'UnitType': 17
							}
						}
					}
				]
			}

			expect(::AccueWeather::Client).to receive(:new)
					.and_return(client)

				expect(client).to receive_message_chain(:uniq_id, :uniq_id)
					.and_return('5643434')

				expect(client).to receive(:historical_temperature)
					.and_return(::AccueWeather::APIResponse.new(res))

				is_expected.to be_successful
				expect(response.status).to eq(200)
			end
		end
	end
end