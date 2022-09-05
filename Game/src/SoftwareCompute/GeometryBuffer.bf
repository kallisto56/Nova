namespace Game
{
	using System;
	using Engine;


	public class GeometryBuffer
	{
		public int tileSize;
		public int tileLength;
		public int countContendersInRow;
		public int countRows;
		public int countColumns;

		public Contender[] contenders;
		public Contender[] sortedContenders;
		public float[] contedersRadiuses;
		public int2[] coordinates;
		public int2 screenBounds;
		public float maximumRadius = 16F;


		public void Initialize (int countRows, int countColumns, int tileSize, float maximumRadius = 16F)
		{
			this.tileSize = tileSize;
			this.tileLength = this.tileSize * this.tileSize;

			this.countRows = countRows;
			this.countColumns = countColumns;

			this.countContendersInRow = this.countRows * this.tileSize;

			this.screenBounds = int2(
				this.countRows * this.tileSize,
				this.countColumns * this.tileSize
			);

			let length = this.screenBounds.width * this.screenBounds.height;

			this.contenders = new Contender[length];
			this.sortedContenders = new Contender[length];
			this.contedersRadiuses = new float[length];
			this.coordinates = new int2[length];

			for (int n = 0; n < length; n++)
			{
				Contender contender = Contender.emptyValue;
				this.contenders[n] = contender;
				this.sortedContenders[n] = contender;
				this.contedersRadiuses[n] = 0F;
				this.contedersRadiuses[n] = int(0);
			}
		}


		public ~this ()
		{
			delete this.contedersRadiuses;
			delete this.sortedContenders;
			delete this.contenders;
			delete this.coordinates;
		}


		public int GetKey (int x, int y)
		{
			return y * this.countContendersInRow + x;
		}


		public int GetKey (int x, int y, int z)
		{
			return ((y * this.countRows) + x) * this.tileLength + z;
		}


	}
	/*public class GeometryBuffer
	{
		public static readonly int TILE_SIZE = 3;
		public static readonly int TILE_LENGTH = 9;
		public int countRows;
		public int countColumns;

		public int width;
		public int height;

		public int2 offset;

		public Tile[] tiles;
		public Tile[] sortedTiles;
		public float[] radiuses;
		public Span<Contender> values;


		public void Initialize (int screenWidth, int screenHeight)
		{
			this.countRows = (screenWidth / TILE_SIZE) + 2;
			this.countColumns = (screenHeight / TILE_SIZE) + 2;
			this.offset = int2(TILE_SIZE, TILE_SIZE);
			this.tiles = new Tile[countRows * countColumns];
			this.sortedTiles = new Tile[countRows * countColumns];
			this.radiuses = new float[countRows * countColumns];
			
			this.values = .((Contender*)tiles.CArray(), this.tiles.Count * 9);

			this.width = this.countRows * TILE_SIZE;
			this.height = this.countColumns * TILE_SIZE;
		}

		public ~this ()
		{
			delete this.radiuses;
			delete this.sortedTiles;
			delete this.tiles;
		}

		public int GetKey (Vector2 pixelCoords)
		{
			int x = int(pixelCoords.x / TILE_SIZE);
			int y = int(pixelCoords.y / TILE_SIZE);

			int xr = int(pixelCoords.x % TILE_SIZE);
			int yr = int(pixelCoords.y % TILE_SIZE);

			int z = yr * TILE_SIZE + xr;

			return this.GetKey(x, y, z);
		}

		public int GetKey (int x, int y, int z)
		{
			return ((y * this.countRows) + x) * TILE_LENGTH + z;
		}

		public int GetKey (int x, int y)
		{
			return ((y * this.countRows) + x) * TILE_LENGTH + 0;
		}

		public Contender GetValue (int x, int y)
		{
			return default;
		}

		public Tile GetTile (int x, int y)
		{
			return default;
		}

		public void SetValue (int x, int y, Contender contender)
		{

		}
	}*/
}