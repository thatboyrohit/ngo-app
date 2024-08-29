
const mongoose = require('mongoose');

const FeedbackSchema = new mongoose.Schema({
  participationGroup: { type: String, required: true },
  date: { type: Date, required: true },
  placeOfActivity: { type: String, required: true },
  category: { type: String, required: true },
  feedbackText: { type: String, required: true },
});

module.exports = mongoose.model('Feedback', FeedbackSchema);