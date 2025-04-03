import os
import json
from googleapiclient.discovery import build
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from dotenv import load_dotenv

app = FastAPI()

# Allow frontend requests
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

load_dotenv()

API_KEY = os.getenv('API_KEY')

# Function to fetch comments
def get_video_comments(video_id):
    youtube = build("youtube", "v3", developerKey=API_KEY)
    
    comments = []
    next_page_token = None

    while True:
        request = youtube.commentThreads().list(
            part="snippet",
            videoId=video_id,
            maxResults=100,  # Max 100 per request
            pageToken=next_page_token
        )
        response = request.execute()

        for item in response.get("items", []):
            comment = item["snippet"]["topLevelComment"]["snippet"]
            comments.append({
                "date": comment["publishedAt"],
                "user": comment["authorDisplayName"],
                "comment": comment["textDisplay"],
                "likes": comment["likeCount"],
                "video_id": video_id
            })

        next_page_token = response.get("nextPageToken")
        if not next_page_token:
            break

    return comments

# Function to video views
def get_video_views(video_id):
    youtube = build("youtube", "v3", developerKey=API_KEY)
    request = youtube.videos().list(
        part="statistics",
        id=video_id
    ).execute()

    views = request['items'][0]['statistics']['viewCount']
    return views

# API Endpoint
@app.get("/fetch-comments/{video_id}")
def fetch_comments(video_id: str):
    comments = get_video_comments(video_id)
    return {"comments": comments}

@app.get("/fetch-views/{video_id}")
def fetch_views(video_id: str):
    views = get_video_views(video_id)
    return {"video_views": views}