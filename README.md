# 🏀 Bucket - 1v1 Basketball Tourney App. 

[![Knightbenax Approved](/knightbenax-approved-blue.svg)](https://twitter.com/knightbenax) [![Platform](https://badgen.net/badge/platform/iPadOS/blue?icon=apple)]()

Handles seeding of matches by randomizing pairs of players into the first 16 matches (Bucket handles only tourneys for 32 players for now), 
creating the remaining matches but leaving them empty and later seeding them from winners from each previous match stage. 

Handles stats so you can see players with the highest points, 3 points, 2 points, fouls, and blocks

![Screenshot](/Screenshots/standings.png?raw=true "")
![Screenshot](/Screenshots/stats.png?raw=true "")
![Screenshot](/Screenshots/players.png?raw=true "")

## Setup & Installation

Download the project and install pods. Run the below in the terminal in the project root folder

```
pod install
```

Open up the Project Workspace file in Xcode, select your signing team, and choose an iPad simulator in the build dropdown. Run the project and you should be good to go. 

Bucket is optimized to run on an iPad

