const express = require("express");
const Feedback = require("../models/feedback");
const feedbackRouter = express.Router();

// Middleware for authentication (make sure this is defined correctly)
const admin = require("../middlewares/admin");

// GET route to fetch feedback
feedbackRouter.get('/api/feedback', admin, async (req, res) => {
    const { participationGroup, startDate, endDate, placeOfActivity, category } = req.query;

    const filter = {};

    if (participationGroup) {
        filter.participationGroup = participationGroup;
    }

    if (startDate && endDate) {
        filter.date = {
            $gte: new Date(startDate),
            $lte: new Date(endDate),
        };
    } else if (startDate) {
        filter.date = {
            $gte: new Date(startDate),
        };
    } else if (endDate) {
        filter.date = {
            $lte: new Date(endDate),
        };
    }

    if (placeOfActivity) {
        filter.placeOfActivity = placeOfActivity;
    }

    if (category) {
        filter.category = category;
    }

    try {
        const feedbacks = await Feedback.find(filter);
        res.json(feedbacks);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

// POST route to add new feedback
feedbackRouter.post('/api/feedback', async (req, res) => {
    const { participationGroup, date, placeOfActivity, category, feedbackText } = req.body;

    // Validate incoming data
    if (!participationGroup || !date || !placeOfActivity || !category || !feedbackText) {
        return res.status(400).json({ message: 'All fields are required.' });
    }

    const feedback = new Feedback({
        participationGroup,
        date: new Date(date),
        placeOfActivity,
        category,
        feedbackText,
    });

    try {
        const newFeedback = await feedback.save();
        res.status(201).json(newFeedback);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
});

module.exports = feedbackRouter;
