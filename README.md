# macOS-client
Mac-OS Client for Natics Apps

## Folder Structure
```
app
├── Util                                    # For any code that needed for development purposes
│   ├── Extensions                          # Foundation/SwiftUI Extensions Files
│   │   ├── Extension+One.swift
│   │   ├── Extension+Two.swift
│   │   └── ...
│   ├── CacheManager                        # Data caching
│   │   ├──  PhotoCacheManager.swift
│   │   └──  ...
│   ├── Constants.swift
│   ├── AnotherUtil.swift 
│   └── ...
├── Networking                             # Networking Modules
│   ├── Interface                          
│   │   ├── Interface+User.swift
│   │   ├── Interface+Employe.swift
│   │   └── ...
│   ├── Request                        
│   │   ├──  Request+User.swift
│   │   └──  ...
│   ├── Interface.swift
│   ├── Connector.swift
│   └── ...
├── ViewModels                             # Global ViewModels
│   ├── UserViewModel                          
│   └── ...
├── Models                                  # Data Models
│   ├── Model.swift
│   └── ...
├── Features                                   # Views and ViewModels for features and components
│   ├──  Components                         # Views and ViewModels that will used in more than 1 Views
│   │    ├── Components1
│   │    │   └── Components1.swift
│   │    │   └── Components1ViewModel.swift
│   │    └── ...
│   ├──  Home                               # Views and ViewModels for a specific page/feature
│   │    ├── Views                    
│   │    │   ├── HomeView.swift
│   │    │   └── ...
│   │    └── ViewModels
│   │        ├── HomeViewModel.swift
│   │        └── ...
│   └── ...
├── Resources
│   ├──  Assets.xcassets 
│   │    ├── AppIcon
│   │    ├── ColorThemes
│   │    ├── AppIcons
│   │    └── ...
│   └── ...  
├── ProjectApp.swift
└── info.plist
```
