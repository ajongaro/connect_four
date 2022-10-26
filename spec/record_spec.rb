require './lib/record'

RSpec.describe Record do
  let(:record) { Record.new("./assets/test_record.csv") }
  describe '#initialize' do
    it 'exists' do
      expect(record).to be_a(Record)
    end

    it 'loads test_record.csv' do 
      record.wipe_file
      record.add_result_for("Anthony","win")

      expect(record.rows[0][0]).to eq("Anthony")
    end
  end

  describe '#add_record' do 
    it 'adds an entry to the record' do
      record.wipe_file

      record.add_result_for("Timmy","tie")
      expect(record.rows[0]).to eq(["Timmy", "0", "0", "1"])
      
      record.add_result_for("Timmy","win")
      expect(record.rows[0]).to eq(["Timmy", "1", "0", "1"])

      record.add_result_for("Timmy","lose")
      expect(record.rows[0]).to eq(["Timmy", "1", "1", "1"])
    end
  end

  describe '#display_hof' do
    it 'displays a list of top three players' do
      record.wipe_file
      record.add_result_for("Anthony","win")
      record.add_result_for("Brady","win")
      record.add_result_for("Thomas","win")
      record.add_result_for("Thomas","win")
      record.add_result_for("Anthony","lose")
      record.add_result_for("Timmah","tie")
      record.add_result_for("Brady","lose")

      record.generate_hof
      expect(record.hall_of_fame[0..2]).to eq([["Thomas", "100.0"], ["Anthony", "50.0"], ["Brady", "50.0"]])
    end
  end

  describe '#dummy' do 
    it 'checks to see if player exists' do
      record.wipe_file   
      record.display_hof
      expect(record.player_exists?("bob")).to be false
    end
  end

  describe '#player_exists?' do 
    it 'checks to see if player exists' do
      record.wipe_file   
      record.add_result_for("Asparagus","tie")
      record.add_result_for("Lavender","win")
      expect(record.player_exists?("Asparagus")).to be true
      expect(record.player_exists?("lavender")).to be true
      expect(record.player_exists?("bob")).to be false
    end
  end

end
