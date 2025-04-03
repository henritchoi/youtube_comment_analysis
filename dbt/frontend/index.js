document.addEventListener("DOMContentLoaded", () => {
    
    //FORM
    const form = document.getElementById("youtube-channel");
    const channelHandle = document.getElementById("channel-handle");
    
    //RESULTS
    const loadingIndicator = document.getElementById("loading");
    const resultsContainer = document.getElementById("results");
    const commentsTableContainer = document.getElementById("comments-table");
    const totalComments = document.getElementById("total-comments");
    const channelViews = document.getElementById("channel-views");
    const totalVideos = document.getElementById("total-videos");
    const timeSeriesChart = document.getElementById("time-series-chart");
    const sentimentAnalysisChart = document.getElementById("sentiment-analysis-chart");

    //FUNCTIONS

    function updateCommentsTable(comments) {
        // Sorting
        const sortedComments = comments.sort((a, b) => new Date(b.date) - new Date(a.date));
        // Get the first 10 comments
        const recentComments = sortedComments.slice(0, 10);
        // Clear existing comments table
        commentsTableContainer.innerHTML = "";
        if (recentComments.length === 0) {
            commentsTableContainer.innerHTML = "<p>No comments found.</p>";
            return;
        }
        // Create a table
        const table = document.createElement("div");
        table.classList.add("table-container");
        // Table Header
        const tableHeader = document.createElement("div");
        tableHeader.classList.add("table-header");
        tableHeader.innerHTML = `
            <div class="table-cell">Date</div>
            <div class="table-cell">User</div>
            <div class="table-cell">Comment</div>
            <div class="table-cell">Likes</div>
            <div class="table-cell">Video</div>
        `;
        table.appendChild(tableHeader);
        // Table Rows
        recentComments.forEach(comment => {
            const row = document.createElement("div");
            row.classList.add("table-row");
            row.innerHTML = `
                <div class="table-cell">${new Date(comment.date).toLocaleString()}</div>
                <div class="table-cell">${comment.user}</div>
                <div class="table-cell">${comment.comment}</div>
                <div class="table-cell">${comment.likes}</div>
                <div class="table-cell">${comment.video_id}</div>
            `;
            table.appendChild(row);
        });
        // Append the table to the comments container
        commentsTableContainer.appendChild(table);
    };

    function updateChannelViews(viewsData, commentsData) {
        channelViews.textContent = viewsData.video_views;
        totalComments.textContent = commentsData.comments.length.toLocaleString();
        totalVideos.textContent = "1";
    };

    function updateTimeSeriesChart(comments) {
        //Clear the chart
        if(timeSeriesChart) {
        timeSeriesChart.destroy();
        };

        //Create a new chart
        //TODO: CREATE CHART FUNCTION
    };

    function updateSentimentAnalysisChart(comments) {
        //TODO: Implement sentiment analysis chart logic
    };

    // EVENT LISTENER
    form.addEventListener("submit", async function (event) {
        event.preventDefault(); // Prevent page reload
        loadingIndicator.classList.remove("hidden");

        const videoId = channelHandle.value.trim();
        if (!videoId) return alert("Please enter a YouTube Video ID!");

        try {
            const response_comments = await fetch(`http://127.0.0.1:8000/fetch-comments/${videoId}`);
            const response_views = await fetch(`http://127.0.0.1:8000/fetch-views/${videoId}`);

            if (!response_comments.ok || !response_views.ok) {
                throw new Error("Failed to fetch data from FastAPI");
            }

            // Parse JSON responses
            const commentsData = await response_comments.json();
            const viewsData = await response_views.json();

            // Update UI with new data
            loadingIndicator.classList.add("hidden");
            updateChannelViews(viewsData, commentsData);
            updateCommentsTable(commentsData.comments);

        } catch (error) {
            console.error("Error fetching data:", error);
            commentsTableContainer.innerHTML = "<p>Failed to fetch comments or views.</p>";
            loadingIndicator.classList.add("hidden");
        }
    });
});
