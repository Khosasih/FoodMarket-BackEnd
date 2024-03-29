<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('transactions') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white">
                <table class="table auto w-full">
                    <thead>
                        <tr>
                            <th class="border px-6 py-4">ID</th>
                            <th class="border px-6 py-4">Food</th>
                            <th class="boder px-6 py-4">User</th>
                            <th class="border px-6 py-4">Quantity</th>
                            <th class="border px-6 py-4">Total</th>
                            <th class="border px-6 py-4">Status</th>
                            <th class="border px-6 py-4">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($transactions as $item)
                        <tr>
                            <td class="border px-6 py-4">{{ ++$i }}</td>
                            <td class="border px-6 py-4">{{ $item->food->name }}</td>
                            <td class="border px-6 py-4">{{ $item->user->name }}</td>
                            <td class="border px-6 py-4">{{ $item->quantity }}</td>
                            <td class="border px-6 py-4">{{ $item->total }}</td>
                            <td class="border px-6 py-4">{{ $item->status }}</td>
                            <td class="border px-6 py-4 text-center">
                                <a href="{{ route('transactions.show', $item->id) }}" class="inline-block bg-orange-500 hover:bg-orange-700 px-6 py-2 text-white font-bold rounded">
                                    View
                                </a>
                                <form action="{{ route('transactions.destroy', $item->id) }}" method="POST" class="inline-block">
                                    {!! method_field('delete') . csrf_field() !!}
                                <button type="submit" class="bg-red-500 hover:bg-red-700 px-6 py-2 text-white font-bold rounded">
                                    Delete
                                </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="border text-center p-5">
                                Data tidak ditemukan
                            </td>
                        </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="text-center mt-5">
                    {{ $transactions->links() }}
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
