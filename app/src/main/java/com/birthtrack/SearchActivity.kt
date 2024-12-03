class SearchActivity : AppCompatActivity() {
    private lateinit var searchView: SearchView
    private lateinit var recommendationsList: RecyclerView
    private lateinit var recommendationsAdapter: RecommendationsAdapter
    
    private val recommendations = listOf(
        Recommendation("DIETARY AND CALORIC RECOMMENDATIONS", "Tap to view details", R.drawable.ic_dietary),
        Recommendation("PHYSICAL ACTIVITY GUIDELINES", "Tap to view details", R.drawable.ic_activity),
        Recommendation("PREVENTION OF BIRTH DEFECTS GUIDELINES", "Tap to view details", R.drawable.ic_prevention),
        Recommendation("MENTAL HEALTH SUPPORT", "Tap to view details", R.drawable.ic_mental_health)
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_search)

        setupSearchView()
        setupRecyclerView()
    }

    private fun setupSearchView() {
        searchView = findViewById(R.id.searchView)
        searchView.setOnQueryTextListener(object : SearchView.OnQueryTextListener {
            override fun onQueryTextSubmit(query: String?): Boolean {
                filterRecommendations(query)
                return true
            }

            override fun onQueryTextChange(newText: String?): Boolean {
                filterRecommendations(newText)
                return true
            }
        })
    }

    private fun setupRecyclerView() {
        recommendationsList = findViewById(R.id.recommendationsList)
        recommendationsAdapter = RecommendationsAdapter(recommendations)
        recommendationsList.adapter = recommendationsAdapter
        recommendationsList.layoutManager = LinearLayoutManager(this)
    }

    private fun filterRecommendations(query: String?) {
        if (query.isNullOrBlank()) {
            recommendationsAdapter.updateList(recommendations)
            return
        }

        val filteredList = recommendations.filter { recommendation ->
            recommendation.title.contains(query, ignoreCase = true)
        }
        recommendationsAdapter.updateList(filteredList)
    }
} 